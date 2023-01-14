# Kitchen Salt Images

Ready to use [kitchen-salt](https://github.com/saltstack/kitchen-salt) Docker Image.
You can use the image for testing salt formulas.

## Usage

### GitLab CI/CD

```yaml
.template_formula_test:
  stage: test
  image: leasyro/kitchen-salt:latest
  services:
    - docker:dind
  cache:
    key: salt_test_bundler
    paths:
      - $BUNDLE_CACHE_PATH
  variables:
    BUNDLE_CACHE_PATH: .bundle
  before_script:
    - bundle config set path $BUNDLE_CACHE_PATH
    - bundle install
    - mkdir -p .gpg #  Optional if you use gpg for your salt pillar
    - echo "$GPG_KEY" > gpg.key && chmod 700 gpg.key #  Optional if you use gpg for your salt pillar
    - gpg --homedir .gpg --import gpg.key #  Optional if you use gpg for your salt pillar
  script:
    - kitchen test $CI_JOB_NAME

kitchen-test-instance-name:
  extends: .template_formula_test
```

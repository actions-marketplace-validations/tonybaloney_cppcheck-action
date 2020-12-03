FROM ubuntu:latest

LABEL com.github.actions.name="c-linter check"
LABEL com.github.actions.description="Lint your code with clang-tidy in parallel to your builds"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="gray-dark"

LABEL repository="https://github.com/tonybaloney/cpp-linter-action"

WORKDIR /build
RUN apt-get update
RUN apt-get -qq -y install curl clang-tidy cmake jq clang cppcheck clang-format

ADD runchecks.sh /entrypoint.sh
COPY . .
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
